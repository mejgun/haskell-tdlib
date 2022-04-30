-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetProxies where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Returns list of proxies that are currently set up. Can be called before authorization
data GetProxies = 

 GetProxies deriving (Eq)

instance Show GetProxies where
 show GetProxies {  } =
  "GetProxies" ++ U.cc [ ]

instance T.ToJSON GetProxies where
 toJSON GetProxies {  } =
  A.object [ "@type" A..= T.String "getProxies" ]

instance T.FromJSON GetProxies where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getProxies" -> parseGetProxies v
   _ -> mempty
  where
   parseGetProxies :: A.Value -> T.Parser GetProxies
   parseGetProxies = A.withObject "GetProxies" $ \o -> do
    return $ GetProxies {  }
 parseJSON _ = mempty
