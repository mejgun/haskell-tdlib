-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.LogStream where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data LogStream = 
 LogStreamDefault 
 | LogStreamFile { max_file_size :: Int, path :: String }  
 | LogStreamEmpty -- deriving (Show)

instance T.ToJSON LogStream where
 toJSON (LogStreamDefault {  }) =
  A.object [ "@type" A..= T.String "logStreamDefault" ]

 toJSON (LogStreamFile { max_file_size = max_file_size, path = path }) =
  A.object [ "@type" A..= T.String "logStreamFile", "max_file_size" A..= max_file_size, "path" A..= path ]

 toJSON (LogStreamEmpty {  }) =
  A.object [ "@type" A..= T.String "logStreamEmpty" ]
-- logStreamDefault LogStream 

-- logStreamFile LogStream  { max_file_size :: Int, path :: String } 

-- logStreamEmpty LogStream 



instance T.FromJSON LogStream where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "logStreamDefault" -> parseLogStreamDefault v
   "logStreamFile" -> parseLogStreamFile v
   "logStreamEmpty" -> parseLogStreamEmpty v
  where
   parseLogStreamDefault :: A.Value -> T.Parser LogStream
   parseLogStreamDefault = A.withObject "LogStreamDefault" $ \o -> do
    return $ LogStreamDefault {  }

   parseLogStreamFile :: A.Value -> T.Parser LogStream
   parseLogStreamFile = A.withObject "LogStreamFile" $ \o -> do
    max_file_size <- o A..: "max_file_size"
    path <- o A..: "path"
    return $ LogStreamFile { max_file_size = max_file_size, path = path }

   parseLogStreamEmpty :: A.Value -> T.Parser LogStream
   parseLogStreamEmpty = A.withObject "LogStreamEmpty" $ \o -> do
    return $ LogStreamEmpty {  }