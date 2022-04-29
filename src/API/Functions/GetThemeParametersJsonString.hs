-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetThemeParametersJsonString where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.ThemeParameters as ThemeParameters

-- |
-- 
-- Converts a themeParameters object to corresponding JSON-serialized string. Can be called synchronously 
-- 
-- __theme__ Theme parameters to convert to JSON
data GetThemeParametersJsonString = 

 GetThemeParametersJsonString { theme :: Maybe ThemeParameters.ThemeParameters }  deriving (Eq)

instance Show GetThemeParametersJsonString where
 show GetThemeParametersJsonString { theme=theme } =
  "GetThemeParametersJsonString" ++ cc [p "theme" theme ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetThemeParametersJsonString where
 toJSON GetThemeParametersJsonString { theme = theme } =
  A.object [ "@type" A..= T.String "getThemeParametersJsonString", "theme" A..= theme ]

instance T.FromJSON GetThemeParametersJsonString where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getThemeParametersJsonString" -> parseGetThemeParametersJsonString v
   _ -> mempty
  where
   parseGetThemeParametersJsonString :: A.Value -> T.Parser GetThemeParametersJsonString
   parseGetThemeParametersJsonString = A.withObject "GetThemeParametersJsonString" $ \o -> do
    theme <- o A..:? "theme"
    return $ GetThemeParametersJsonString { theme = theme }
 parseJSON _ = mempty
