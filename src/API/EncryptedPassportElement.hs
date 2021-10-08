-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.EncryptedPassportElement where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.DatedFile as DatedFile
import {-# SOURCE #-} qualified API.PassportElementType as PassportElementType

-- |
-- 
-- Contains information about an encrypted Telegram Passport element; for bots only 
-- 
-- __type__ Type of Telegram Passport element
-- 
-- __data__ Encrypted JSON-encoded data about the user
-- 
-- __front_side__ The front side of an identity document
-- 
-- __reverse_side__ The reverse side of an identity document; may be null
-- 
-- __selfie__ Selfie with the document; may be null
-- 
-- __translation__ List of files containing a certified English translation of the document
-- 
-- __files__ List of attached files
-- 
-- __value__ Unencrypted data, phone number or email address
-- 
-- __hash__ Hash of the entire element
data EncryptedPassportElement = 

 EncryptedPassportElement { hash :: Maybe String, value :: Maybe String, files :: Maybe [DatedFile.DatedFile], translation :: Maybe [DatedFile.DatedFile], selfie :: Maybe DatedFile.DatedFile, reverse_side :: Maybe DatedFile.DatedFile, front_side :: Maybe DatedFile.DatedFile, _data :: Maybe String, _type :: Maybe PassportElementType.PassportElementType }  deriving (Eq)

instance Show EncryptedPassportElement where
 show EncryptedPassportElement { hash=hash, value=value, files=files, translation=translation, selfie=selfie, reverse_side=reverse_side, front_side=front_side, _data=_data, _type=_type } =
  "EncryptedPassportElement" ++ cc [p "hash" hash, p "value" value, p "files" files, p "translation" translation, p "selfie" selfie, p "reverse_side" reverse_side, p "front_side" front_side, p "_data" _data, p "_type" _type ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON EncryptedPassportElement where
 toJSON EncryptedPassportElement { hash = hash, value = value, files = files, translation = translation, selfie = selfie, reverse_side = reverse_side, front_side = front_side, _data = _data, _type = _type } =
  A.object [ "@type" A..= T.String "encryptedPassportElement", "hash" A..= hash, "value" A..= value, "files" A..= files, "translation" A..= translation, "selfie" A..= selfie, "reverse_side" A..= reverse_side, "front_side" A..= front_side, "data" A..= _data, "type" A..= _type ]

instance T.FromJSON EncryptedPassportElement where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "encryptedPassportElement" -> parseEncryptedPassportElement v
   _ -> mempty
  where
   parseEncryptedPassportElement :: A.Value -> T.Parser EncryptedPassportElement
   parseEncryptedPassportElement = A.withObject "EncryptedPassportElement" $ \o -> do
    hash <- o A..:? "hash"
    value <- o A..:? "value"
    files <- o A..:? "files"
    translation <- o A..:? "translation"
    selfie <- o A..:? "selfie"
    reverse_side <- o A..:? "reverse_side"
    front_side <- o A..:? "front_side"
    _data <- o A..:? "data"
    _type <- o A..:? "type"
    return $ EncryptedPassportElement { hash = hash, value = value, files = files, translation = translation, selfie = selfie, reverse_side = reverse_side, front_side = front_side, _data = _data, _type = _type }
 parseJSON _ = mempty
