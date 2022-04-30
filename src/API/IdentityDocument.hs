-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.IdentityDocument where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.DatedFile as DatedFile
import {-# SOURCE #-} qualified API.Date as Date

-- |
-- 
-- An identity document 
-- 
-- __number__ Document number; 1-24 characters
-- 
-- __expiry_date__ Document expiry date; may be null if not applicable
-- 
-- __front_side__ Front side of the document
-- 
-- __reverse_side__ Reverse side of the document; only for driver license and identity card; may be null
-- 
-- __selfie__ Selfie with the document; may be null
-- 
-- __translation__ List of files containing a certified English translation of the document
data IdentityDocument = 

 IdentityDocument { translation :: Maybe [DatedFile.DatedFile], selfie :: Maybe DatedFile.DatedFile, reverse_side :: Maybe DatedFile.DatedFile, front_side :: Maybe DatedFile.DatedFile, expiry_date :: Maybe Date.Date, number :: Maybe String }  deriving (Eq)

instance Show IdentityDocument where
 show IdentityDocument { translation=translation, selfie=selfie, reverse_side=reverse_side, front_side=front_side, expiry_date=expiry_date, number=number } =
  "IdentityDocument" ++ U.cc [U.p "translation" translation, U.p "selfie" selfie, U.p "reverse_side" reverse_side, U.p "front_side" front_side, U.p "expiry_date" expiry_date, U.p "number" number ]

instance T.ToJSON IdentityDocument where
 toJSON IdentityDocument { translation = translation, selfie = selfie, reverse_side = reverse_side, front_side = front_side, expiry_date = expiry_date, number = number } =
  A.object [ "@type" A..= T.String "identityDocument", "translation" A..= translation, "selfie" A..= selfie, "reverse_side" A..= reverse_side, "front_side" A..= front_side, "expiry_date" A..= expiry_date, "number" A..= number ]

instance T.FromJSON IdentityDocument where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "identityDocument" -> parseIdentityDocument v
   _ -> mempty
  where
   parseIdentityDocument :: A.Value -> T.Parser IdentityDocument
   parseIdentityDocument = A.withObject "IdentityDocument" $ \o -> do
    translation <- o A..:? "translation"
    selfie <- o A..:? "selfie"
    reverse_side <- o A..:? "reverse_side"
    front_side <- o A..:? "front_side"
    expiry_date <- o A..:? "expiry_date"
    number <- o A..:? "number"
    return $ IdentityDocument { translation = translation, selfie = selfie, reverse_side = reverse_side, front_side = front_side, expiry_date = expiry_date, number = number }
 parseJSON _ = mempty
