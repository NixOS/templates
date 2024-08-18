module.exports = {
 
  // Currently we need to add '.ts' to the resolve.extensions array.
  resolve: {
    extensions: ['.ts', '.tsx', '.js', '.jsx']
  },
 
  // Source maps support ('inline-source-map' also works)
  devtool: 'source-map',
  mode: 'development',
 
  // Add the loader for .ts files.
  module: {
    rules: [
      {
        test: /\.tsx?$/,
        loader: 'ts-loader'
      }
    ]
  },
  devServer: {
    static: './dist',
    }
};