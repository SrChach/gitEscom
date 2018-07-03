import java.io.*;
import java.util.*;

import org.apache.hadoop.fs.Path;
import org.apache.hadoop.conf.*;
import org.apache.hadoop.io.*;
import org.apache.hadoop.mapreduce.*;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.input.TextInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.mapreduce.lib.output.TextOutputFormat;

public class BigCounter {

    public static class Map extends Mapper<LongWritable, Text, Text, IntWritable> {

        private Text llave = new Text();

        public void map(LongWritable key, Text value, Context context) throws IOException, InterruptedException {
            String line = value.toString();
            if( line.length() == 0 ) return;

            StringTokenizer tokenizer = new StringTokenizer(line, ",");
            System.out.println("#### "+line);

            String sx = tokenizer.nextToken();
            String sy = tokenizer.nextToken();
            int x = Integer.parseInt(sx);
            int y = Integer.parseInt(sy);
            llave.set("x");
            context.write(llave, new IntWritable(x));

            llave.set("x2");
            context.write(llave, new IntWritable(x * x));

            llave.set("y");
            context.write(llave, new IntWritable(y));

            llave.set("xy");
            context.write(llave, new IntWritable(x * y));
        }
    }

    public static class Reduce extends Reducer<Text, IntWritable, Text, IntWritable> {
        int n = 0;
        int sumX = 0;
        int sumX2 = 0;
        int sumY = 0;
        int sumXY = 0;


        public void reduce(Text key, Iterable<IntWritable> values, Context context)
                throws IOException, InterruptedException {
            String llave = key.toString();
            if (llave.compareTo("x") == 0) {
                for (IntWritable val : values) {
                    sumX += val.get();
                    n += 1;
                }
            }

            if (llave.compareTo("y") == 0) {
                for (IntWritable val : values) {
                    sumY += val.get();
                }
            }

            if (llave.compareTo("x2") == 0) {
                for (IntWritable val : values) {
                    sumX2 += val.get();
                }
            }

            if (llave.compareTo("xy") == 0) {
                for (IntWritable val : values) {
                    sumXY += val.get();
                }
            }
           // context.write(new Text("r"), new IntWritable(1));
        }

        @Override
        protected void cleanup(Context context) throws IOException, InterruptedException {

            double b = 0;
            double m = 0;

            m = (double) (n * sumXY - sumX * sumY) / (double) (n * sumX2 - (sumX * sumX));
            b = ((double)sumY - m * sumX) / (double) n;

            BufferedWriter salida = new BufferedWriter(new FileWriter("/home/cic/regr.dat",false));
            salida.write(""+n+"\n"+b+"\n"+m+"\n\n");
            salida.close();

            System.out.println("n="+n+"\nb=" + b + "  \nm=" + m);
            //context.write(new Text("b"), new IntWritable(2));
        }
    }


    public static class Map2 extends Mapper<LongWritable, Text, Text, DoubleWritable> {
        private Text llave = new Text();
        double m = 0;
        double b = 0;
        double suma = 0;
        double n = 0;

        protected void setup(Context context) throws IOException, InterruptedException {
            BufferedReader entrada = new BufferedReader(new FileReader("/home/cic/regr.dat"));

            String dato = entrada.readLine();
            n = Double.parseDouble(dato);
            dato = entrada.readLine();
            b = Double.parseDouble(dato);
            dato = entrada.readLine();
            m = Double.parseDouble(dato);
            entrada.close();
        }


        public void map(LongWritable key, Text value, Context context) throws IOException, InterruptedException {
            String line = value.toString();
            if (line.length() == 0) return;

            StringTokenizer tokenizer = new StringTokenizer(line, ",");
            System.out.println("==== " + line);

            String sx = tokenizer.nextToken();
            String sy = tokenizer.nextToken();
            int x = Integer.parseInt(sx);
            int y = Integer.parseInt(sy);

            double yGorro = m * x + b;

            double errorY = Math.pow(y - yGorro,2);
            suma += errorY;

            System.out.println("X="+x+"  Y="+y+"  y="+yGorro);

            llave.set("e");
            context.write(llave, new DoubleWritable(errorY));
        }

        @Override
        protected void cleanup(Context context) throws IOException, InterruptedException {

         System.out.println("Error=" + suma+"   "+ Math.sqrt(suma / n));
        }
    }

    public static void main(String[] args) throws Exception {
        Configuration conf = new Configuration();

        Job job = new Job(conf, "Regresion");

        job.setOutputKeyClass(Text.class);
        job.setOutputValueClass(IntWritable.class);

        job.setMapperClass(Map.class);
        job.setReducerClass(Reduce.class);

        job.setInputFormatClass(TextInputFormat.class);
        job.setOutputFormatClass(TextOutputFormat.class);

        FileInputFormat.addInputPath(job, new Path("/home/cic/datosr2.txt"));
        FileOutputFormat.setOutputPath(job, new Path("/home/cic/zz1"));

        job.waitForCompletion(true);


        Configuration conf2 = new Configuration();

        Job job2 = new Job(conf2, "Regresion error");

        job2.setOutputKeyClass(Text.class);
        job2.setOutputValueClass(DoubleWritable.class);

        job2.setMapperClass(Map2.class);

        job2.setInputFormatClass(TextInputFormat.class);

        FileInputFormat.addInputPath(job2, new Path("/home/cic/datosr2.txt"));
        FileOutputFormat.setOutputPath(job2, new Path("/home/cic/zz2"));

        job2.waitForCompletion(true);
    }
}