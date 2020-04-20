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

