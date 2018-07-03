import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.StringTokenizer;
import java.util.Scanner;
import java.io.FileReader;
import java.lang.*;
import java.io.DataInput;
import java.io.DataOutput;
import java.io.IOException;
import java.io.File;
import java.net.URI;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.TreeMap;

import org.apache.commons.io.FileUtils;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.FloatWritable;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.NullWritable;
import org.apache.hadoop.io.WritableComparable;
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


public class myKnn {

	public static class DoubleString implements WritableComparable<DoubleString> {
		private Double distance = 0.0;
		private String model = null;

		public void set(Double lhs, String rhs){
			distance = lhs;
			model = rhs;
		}
		
		public Double getDistance()	{
			return distance;
		}
		
		public String getModel(){
			return model;
		}
		
		@Override
		public void readFields(DataInput in) throws IOException{
			distance = in.readDouble();
			model = in.readUTF();
		}
		
		@Override
		public void write(DataOutput out) throws IOException{
			out.writeDouble(distance);
			out.writeUTF(model);
		}
		
		@Override
		public int compareTo(DoubleString o){
			return (this.model).compareTo(o.model);
		}
	}

	public static class KnnMapper extends Mapper<Object, Text, NullWritable, DoubleString>{
	




	public static void main(String[] args) throws Exception {
		Configuration conf = new Configuration();
		String[] arguments = new GenericOptionsParser(conf, args).getRemainingArgs();
		if (arguments.length != 2) {
			System.err.println("forma de uso: myKnn <archivo de entrada> <Directorio de salida>");
			System.exit(2);
		}

		System.exit(0);



	}

}