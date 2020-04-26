-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.InputIdentityDocument where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputFile as InputFile
import {-# SOURCE #-} qualified API.Date as Date

-- |
-- 
-- An identity document to be saved to Telegram Passport 
-- 
-- __number__ Document number; 1-24 characters
-- 
-- __expiry_date__ Document expiry date, if available
-- 
-- __front_side__ Front side of the document
-- 
-- __reverse_side__ Reverse side of the document; only for driver license and identity card
-- 
-- __selfie__ Selfie with the document, if available
-- 
-- __translation__ List of files containing a certified English translation of the document
data InputIdentityDocument = 
 InputIdentityDocument { translation :: Maybe [InputFile.InputFile], selfie :: Maybe InputFile.InputFile, reverse_side :: Maybe InputFile.InputFile, front_side :: Maybe InputFile.InputFile, expiry_date :: Maybe Date.Date, number :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON InputIdentityDocument where
 toJSON (InputIdentityDocument { translation = translation, selfie = selfie, reverse_side = reverse_side, front_side = front_side, expiry_date = expiry_date, number = number }) =
  A.object [ "@type" A..= T.String "inputIdentityDocument", "translation" A..= translation, "selfie" A..= selfie, "reverse_side" A..= reverse_side, "front_side" A..= front_side, "expiry_date" A..= expiry_date, "number" A..= number ]

instance T.FromJSON InputIdentityDocument where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "inputIdentityDocument" -> parseInputIdentityDocument v
   _ -> mempty
  where
   parseInputIdentityDocument :: A.Value -> T.Parser InputIdentityDocument
   parseInputIdentityDocument = A.withObject "InputIdentityDocument" $ \o -> do
    translation <- o A..:? "translation"
    selfie <- o A..:? "selfie"
    reverse_side <- o A..:? "reverse_side"
    front_side <- o A..:? "front_side"
    expiry_date <- o A..:? "expiry_date"
    number <- o A..:? "number"
    return $ InputIdentityDocument { translation = translation, selfie = selfie, reverse_side = reverse_side, front_side = front_side, expiry_date = expiry_date, number = number }