-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetLogStream where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetLogStream = 
 GetLogStream deriving (Show, Eq)

instance T.ToJSON GetLogStream where
 toJSON (GetLogStream {  }) =
  A.object [ "@type" A..= T.String "getLogStream" ]

instance T.FromJSON GetLogStream where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getLogStream" -> parseGetLogStream v
   _ -> mempty
  where
   parseGetLogStream :: A.Value -> T.Parser GetLogStream
   parseGetLogStream = A.withObject "GetLogStream" $ \o -> do
    return $ GetLogStream {  }