-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Proxies where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.Proxy as Proxy

-- |
-- 
-- Represents a list of proxy servers 
-- 
-- __proxies__ List of proxy servers
data Proxies = 

 Proxies { proxies :: Maybe [Proxy.Proxy] }  deriving (Eq)

instance Show Proxies where
 show Proxies { proxies=proxies } =
  "Proxies" ++ cc [p "proxies" proxies ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON Proxies where
 toJSON Proxies { proxies = proxies } =
  A.object [ "@type" A..= T.String "proxies", "proxies" A..= proxies ]

instance T.FromJSON Proxies where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "proxies" -> parseProxies v
   _ -> mempty
  where
   parseProxies :: A.Value -> T.Parser Proxies
   parseProxies = A.withObject "Proxies" $ \o -> do
    proxies <- o A..:? "proxies"
    return $ Proxies { proxies = proxies }
 parseJSON _ = mempty
