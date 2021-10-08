-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.LanguagePackStrings where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.LanguagePackString as LanguagePackString

-- |
-- 
-- Contains a list of language pack strings 
-- 
-- __strings__ A list of language pack strings
data LanguagePackStrings = 

 LanguagePackStrings { strings :: Maybe [LanguagePackString.LanguagePackString] }  deriving (Eq)

instance Show LanguagePackStrings where
 show LanguagePackStrings { strings=strings } =
  "LanguagePackStrings" ++ cc [p "strings" strings ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON LanguagePackStrings where
 toJSON LanguagePackStrings { strings = strings } =
  A.object [ "@type" A..= T.String "languagePackStrings", "strings" A..= strings ]

instance T.FromJSON LanguagePackStrings where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "languagePackStrings" -> parseLanguagePackStrings v
   _ -> mempty
  where
   parseLanguagePackStrings :: A.Value -> T.Parser LanguagePackStrings
   parseLanguagePackStrings = A.withObject "LanguagePackStrings" $ \o -> do
    strings <- o A..:? "strings"
    return $ LanguagePackStrings { strings = strings }
 parseJSON _ = mempty
