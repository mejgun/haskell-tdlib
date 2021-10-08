-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetCountries where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns information about existing countries. Can be called before authorization
data GetCountries = 

 GetCountries deriving (Eq)

instance Show GetCountries where
 show GetCountries {  } =
  "GetCountries" ++ cc [ ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetCountries where
 toJSON GetCountries {  } =
  A.object [ "@type" A..= T.String "getCountries" ]

instance T.FromJSON GetCountries where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getCountries" -> parseGetCountries v
   _ -> mempty
  where
   parseGetCountries :: A.Value -> T.Parser GetCountries
   parseGetCountries = A.withObject "GetCountries" $ \o -> do
    return $ GetCountries {  }
 parseJSON _ = mempty
