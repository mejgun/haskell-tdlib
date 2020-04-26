-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetLogStream where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Returns information about currently used log stream for internal logging of TDLib. This is an offline method. Can be called before authorization. Can be called synchronously
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