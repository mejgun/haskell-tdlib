-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetApplicationConfig where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns application config, provided by the server. Can be called before authorization
data GetApplicationConfig = 

 GetApplicationConfig deriving (Eq)

instance Show GetApplicationConfig where
 show GetApplicationConfig {  } =
  "GetApplicationConfig" ++ cc [ ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetApplicationConfig where
 toJSON GetApplicationConfig {  } =
  A.object [ "@type" A..= T.String "getApplicationConfig" ]

instance T.FromJSON GetApplicationConfig where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getApplicationConfig" -> parseGetApplicationConfig v
   _ -> mempty
  where
   parseGetApplicationConfig :: A.Value -> T.Parser GetApplicationConfig
   parseGetApplicationConfig = A.withObject "GetApplicationConfig" $ \o -> do
    return $ GetApplicationConfig {  }
 parseJSON _ = mempty
