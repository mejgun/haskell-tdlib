-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetProxies where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetProxies = 
 GetProxies deriving (Show)

instance T.ToJSON GetProxies where
 toJSON (GetProxies {  }) =
  A.object [ "@type" A..= T.String "getProxies" ]



instance T.FromJSON GetProxies where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getProxies" -> parseGetProxies v

   _ -> mempty ""
  where
   parseGetProxies :: A.Value -> T.Parser GetProxies
   parseGetProxies = A.withObject "GetProxies" $ \o -> do
    return $ GetProxies {  }