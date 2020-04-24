-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.IdentityDocument where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.DatedFile as DatedFile
import {-# SOURCE #-} qualified API.Date as Date

data IdentityDocument = 
 IdentityDocument { translation :: Maybe [DatedFile.DatedFile], selfie :: Maybe DatedFile.DatedFile, reverse_side :: Maybe DatedFile.DatedFile, front_side :: Maybe DatedFile.DatedFile, expiry_date :: Maybe Date.Date, number :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON IdentityDocument where
 toJSON (IdentityDocument { translation = translation, selfie = selfie, reverse_side = reverse_side, front_side = front_side, expiry_date = expiry_date, number = number }) =
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
    translation <- optional $ o A..: "translation"
    selfie <- optional $ o A..: "selfie"
    reverse_side <- optional $ o A..: "reverse_side"
    front_side <- optional $ o A..: "front_side"
    expiry_date <- optional $ o A..: "expiry_date"
    number <- optional $ o A..: "number"
    return $ IdentityDocument { translation = translation, selfie = selfie, reverse_side = reverse_side, front_side = front_side, expiry_date = expiry_date, number = number }