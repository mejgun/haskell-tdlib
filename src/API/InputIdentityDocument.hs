-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.InputIdentityDocument where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.InputFile as InputFile
import {-# SOURCE #-} qualified API.Date as Date

-- |
-- 
-- An identity document to be saved to Telegram Passport 
-- 
-- __number__ Document number; 1-24 characters
-- 
-- __expiry_date__ Document expiry date; pass null if not applicable
-- 
-- __front_side__ Front side of the document
-- 
-- __reverse_side__ Reverse side of the document; only for driver license and identity card; pass null otherwise
-- 
-- __selfie__ Selfie with the document; pass null if unavailable
-- 
-- __translation__ List of files containing a certified English translation of the document
data InputIdentityDocument = 

 InputIdentityDocument { translation :: Maybe [InputFile.InputFile], selfie :: Maybe InputFile.InputFile, reverse_side :: Maybe InputFile.InputFile, front_side :: Maybe InputFile.InputFile, expiry_date :: Maybe Date.Date, number :: Maybe String }  deriving (Eq)

instance Show InputIdentityDocument where
 show InputIdentityDocument { translation=translation, selfie=selfie, reverse_side=reverse_side, front_side=front_side, expiry_date=expiry_date, number=number } =
  "InputIdentityDocument" ++ cc [p "translation" translation, p "selfie" selfie, p "reverse_side" reverse_side, p "front_side" front_side, p "expiry_date" expiry_date, p "number" number ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON InputIdentityDocument where
 toJSON InputIdentityDocument { translation = translation, selfie = selfie, reverse_side = reverse_side, front_side = front_side, expiry_date = expiry_date, number = number } =
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
 parseJSON _ = mempty
