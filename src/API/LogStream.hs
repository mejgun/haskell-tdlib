-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.LogStream where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Describes a stream to which TDLib internal log is written
data LogStream = 
 -- |
 -- 
 -- The log is written to stderr or an OS specific log
 LogStreamDefault |
 -- |
 -- 
 -- The log is written to a file
 -- 
 -- __path__ Path to the file to where the internal TDLib log will be written
 -- 
 -- __max_file_size__ The maximum size of the file to where the internal TDLib log is written before the file will be auto-rotated, in bytes
 -- 
 -- __redirect_stderr__ Pass true to additionally redirect stderr to the log file. Ignored on Windows
 LogStreamFile { redirect_stderr :: Maybe Bool, max_file_size :: Maybe Int, path :: Maybe String }  |
 -- |
 -- 
 -- The log is written nowhere
 LogStreamEmpty deriving (Show, Eq)

instance T.ToJSON LogStream where
 toJSON (LogStreamDefault {  }) =
  A.object [ "@type" A..= T.String "logStreamDefault" ]

 toJSON (LogStreamFile { redirect_stderr = redirect_stderr, max_file_size = max_file_size, path = path }) =
  A.object [ "@type" A..= T.String "logStreamFile", "redirect_stderr" A..= redirect_stderr, "max_file_size" A..= max_file_size, "path" A..= path ]

 toJSON (LogStreamEmpty {  }) =
  A.object [ "@type" A..= T.String "logStreamEmpty" ]

instance T.FromJSON LogStream where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "logStreamDefault" -> parseLogStreamDefault v
   "logStreamFile" -> parseLogStreamFile v
   "logStreamEmpty" -> parseLogStreamEmpty v
   _ -> mempty
  where
   parseLogStreamDefault :: A.Value -> T.Parser LogStream
   parseLogStreamDefault = A.withObject "LogStreamDefault" $ \o -> do
    return $ LogStreamDefault {  }

   parseLogStreamFile :: A.Value -> T.Parser LogStream
   parseLogStreamFile = A.withObject "LogStreamFile" $ \o -> do
    redirect_stderr <- o A..:? "redirect_stderr"
    max_file_size <- mconcat [ o A..:? "max_file_size", readMaybe <$> (o A..: "max_file_size" :: T.Parser String)] :: T.Parser (Maybe Int)
    path <- o A..:? "path"
    return $ LogStreamFile { redirect_stderr = redirect_stderr, max_file_size = max_file_size, path = path }

   parseLogStreamEmpty :: A.Value -> T.Parser LogStream
   parseLogStreamEmpty = A.withObject "LogStreamEmpty" $ \o -> do
    return $ LogStreamEmpty {  }