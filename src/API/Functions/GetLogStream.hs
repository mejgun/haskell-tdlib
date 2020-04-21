-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetLogStream where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetLogStream = 
 GetLogStream deriving (Show)

instance T.ToJSON GetLogStream where
 toJSON (GetLogStream {  }) =
  A.object [ "@type" A..= T.String "getLogStream" ]



instance T.FromJSON GetLogStream where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getLogStream" -> parseGetLogStream v

   _ -> mempty ""
  where
   parseGetLogStream :: A.Value -> T.Parser GetLogStream
   parseGetLogStream = A.withObject "GetLogStream" $ \o -> do
    return $ GetLogStream {  }