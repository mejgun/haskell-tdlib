-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetCountryCode where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Uses the current IP address to find the current country. Returns two-letter ISO 3166-1 alpha-2 country code. Can be called before authorization
data GetCountryCode = 

 GetCountryCode deriving (Eq)

instance Show GetCountryCode where
 show GetCountryCode {  } =
  "GetCountryCode" ++ cc [ ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetCountryCode where
 toJSON GetCountryCode {  } =
  A.object [ "@type" A..= T.String "getCountryCode" ]

instance T.FromJSON GetCountryCode where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getCountryCode" -> parseGetCountryCode v
   _ -> mempty
  where
   parseGetCountryCode :: A.Value -> T.Parser GetCountryCode
   parseGetCountryCode = A.withObject "GetCountryCode" $ \o -> do
    return $ GetCountryCode {  }
 parseJSON _ = mempty
