-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetLogStream where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.LogStream as LogStream

data SetLogStream = 
 SetLogStream { log_stream :: LogStream.LogStream }  deriving (Show)

instance T.ToJSON SetLogStream where
 toJSON (SetLogStream { log_stream = log_stream }) =
  A.object [ "@type" A..= T.String "setLogStream", "log_stream" A..= log_stream ]

instance T.FromJSON SetLogStream where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setLogStream" -> parseSetLogStream v
   _ -> mempty
  where
   parseSetLogStream :: A.Value -> T.Parser SetLogStream
   parseSetLogStream = A.withObject "SetLogStream" $ \o -> do
    log_stream <- o A..: "log_stream"
    return $ SetLogStream { log_stream = log_stream }