-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.LanguagePackStrings where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.LanguagePackString as LanguagePackString

data LanguagePackStrings = 
 LanguagePackStrings { strings :: Maybe [LanguagePackString.LanguagePackString] }  deriving (Show)

instance T.ToJSON LanguagePackStrings where
 toJSON (LanguagePackStrings { strings = strings }) =
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
    strings <- optional $ o A..: "strings"
    return $ LanguagePackStrings { strings = strings }