-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetLanguagePackStrings where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetLanguagePackStrings = 
 GetLanguagePackStrings { keys :: Maybe [String], language_pack_id :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON GetLanguagePackStrings where
 toJSON (GetLanguagePackStrings { keys = keys, language_pack_id = language_pack_id }) =
  A.object [ "@type" A..= T.String "getLanguagePackStrings", "keys" A..= keys, "language_pack_id" A..= language_pack_id ]

instance T.FromJSON GetLanguagePackStrings where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getLanguagePackStrings" -> parseGetLanguagePackStrings v
   _ -> mempty
  where
   parseGetLanguagePackStrings :: A.Value -> T.Parser GetLanguagePackStrings
   parseGetLanguagePackStrings = A.withObject "GetLanguagePackStrings" $ \o -> do
    keys <- optional $ o A..: "keys"
    language_pack_id <- optional $ o A..: "language_pack_id"
    return $ GetLanguagePackStrings { keys = keys, language_pack_id = language_pack_id }