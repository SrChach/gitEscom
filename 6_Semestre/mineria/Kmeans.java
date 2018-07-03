import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.StringTokenizer;
import java.util.Scanner;
import java.io.FileReader;
import java.lang.*;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.FloatWritable;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.input.TextInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.util.GenericOptionsParser;
import org.apache.hadoop.filecache.DistributedCache;
import org.apache.hadoop.mapreduce.lib.output.TextOutputFormat;

public class Kmeans {

	public static class KmeansMapper extends Mapper<LongWritable, TwoDPointWritable, IntWritable, TwoDPointWritable>{
		public final static String centerfile="centers.txt";
		public float[][] centroids = new float[50][3];
		int n=0;

		public void setup(Context context) throws IOException {
			Scanner reader = new Scanner(new FileReader(centerfile));
			int i = 0;
			//for (int  i=0; i<15; i++ ) {
			while(reader.hasNext()){
				n++;
				int pos = reader.nextInt();
				centroids[i][2] = pos;
				centroids[i][0] = reader.nextFloat();
				centroids[i][1] = reader.nextFloat();
				i++;
			}
		}

		public void map(LongWritable key, TwoDPointWritable value, Context context) throws IOException, InterruptedException {
			float distance=0;
			float mindistance=999999999.9f;
			int winnercentroid=-1;
			int i=0;

			FloatWritable X = value.getx();
			FloatWritable Y = value.gety();
			float x = X.get();
			float y = Y.get();
			for ( i=0; i<n; i++ ) {
				distance = (float)Math.sqrt(( x-centroids[i][0])*(x-centroids[i][0]) + (y - centroids[i][1])*(y-centroids[i][1]));
				if ( distance < mindistance ) {
					mindistance = distance;
					winnercentroid=i;
				}
			}

			IntWritable winnerCentroid = new IntWritable((int)centroids[winnercentroid][2]);
			context.write(winnerCentroid, value);
			System.out.printf("Map: Centroid = %d distance = %f\n", winnercentroid, mindistance);
		}
	}

	public static class KmeansReducer extends Reducer<IntWritable,TwoDPointWritable,IntWritable,Text> {
		protected void setup(Context context) throws IOException, InterruptedException {
			BufferedWriter salida = new BufferedWriter(new FileWriter("/home/user/IdeaProjects/kmeans/data/centers.txt",false));
			salida.close();
		}


		public void reduce(IntWritable clusterid, Iterable<TwoDPointWritable> points, Context context) throws IOException, InterruptedException {

			int num = 0;
			float centerx=0.0f;
			float centery=0.0f;
			for (TwoDPointWritable point : points) {
				num++;
				FloatWritable X = point.getx();
				FloatWritable Y = point.gety();
				float x = X.get();
				float y = Y.get();
				centerx += x;
				centery += y;
			}
			centerx = centerx/num;
			centery = centery/num;

			/*String preres = String.format("%f %f", centerx, centery);
			Text result = new Text(preres);
			context.write(clusterid, result);*/
			BufferedWriter salida = new BufferedWriter(new FileWriter("/home/user/IdeaProjects/kmeans/data/centers.txt",true));
			salida.write(""+clusterid+" "+centerx+" "+centery+"\n");
			salida.close();
		}
	}

	public static void main(String[] args) throws Exception {
		//for (int i=0;i<20;i++) {
			Configuration conf = new Configuration();
			String[] otherArgs = new GenericOptionsParser(conf, args).getRemainingArgs();
			if (otherArgs.length != 2) {
				System.err.println("Usage: kmeans <in> <out>");
				System.exit(2);
			}

			Job job = new Job(conf, "kmeans");
			Path toCache = new Path("data/centers.txt");

			job.addCacheFile(toCache.toUri());
			job.createSymlink();

			job.setJarByClass(kmeans.class);
			job.setMapperClass(KmeansMapper.class);
			job.setReducerClass(KmeansReducer.class);

			job.setInputFormatClass(TwoDPointFileInputFormat.class);
			FileInputFormat.addInputPath(job, new Path(otherArgs[0]));

			job.setMapOutputKeyClass(IntWritable.class);
			job.setMapOutputValueClass(TwoDPointWritable.class);

			FileOutputFormat.setOutputPath(job, new Path(otherArgs[1]));
			job.setOutputKeyClass(IntWritable.class);
			job.setOutputValueClass(Text.class);

			System.exit(job.waitForCompletion(true) ? 0 : 1);
/*
			Configuration conf2 = new Configuration();
		otherArgs = new GenericOptionsParser(conf, args).getRemainingArgs();
		if (otherArgs.length != 2) {
			System.err.println("Usage: kmeans <in> <out>");
			System.exit(2);
		}
		Job job2 = new Job(conf2, "kmeans");

		job2.addCacheFile(toCache.toUri());
		job2.createSymlink();

		job2.setJarByClass(kmeans.class);
		job2.setMapperClass(KmeansMapper.class);
		job2.setReducerClass(KmeansReducer.class);

		job2.setInputFormatClass(TwoDPointFileInputFormat.class);
		FileInputFormat.addInputPath(job2, new Path(otherArgs[0]));

		job2.setMapOutputKeyClass(IntWritable.class);
		job2.setMapOutputValueClass(TwoDPointWritable.class);

		FileOutputFormat.setOutputPath(job2, new Path(otherArgs[1]+"2"));
		job2.setOutputKeyClass(IntWritable.class);
		job2.setOutputValueClass(Text.class);

		System.exit(job2.waitForCompletion(true) ? 0 : 1);
		//}*/
	}
}