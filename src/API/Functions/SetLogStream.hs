-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetLogStream where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.LogStream as LogStream

--main = putStrLn "ok"

data SetLogStream = 
 SetLogStream { log_stream :: LogStream.LogStream }  -- deriving (Show)

instance T.ToJSON SetLogStream where
 toJSON (SetLogStream { log_stream = log_stream }) =
  A.object [ "@type" A..= T.String "setLogStream", "log_stream" A..= log_stream ]
-- setLogStream SetLogStream  { log_stream :: LogStream.LogStream } 

