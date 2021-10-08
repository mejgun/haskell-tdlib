-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SendPassportAuthorizationForm where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.PassportElementType as PassportElementType

-- |
-- 
-- Sends a Telegram Passport authorization form, effectively sharing data with the service. This method must be called after getPassportAuthorizationFormAvailableElements if some previously available elements are going to be reused
-- 
-- __autorization_form_id__ Authorization form identifier
-- 
-- __types__ Types of Telegram Passport elements chosen by user to complete the authorization form
data SendPassportAuthorizationForm = 

 SendPassportAuthorizationForm { types :: Maybe [PassportElementType.PassportElementType], autorization_form_id :: Maybe Int }  deriving (Eq)

instance Show SendPassportAuthorizationForm where
 show SendPassportAuthorizationForm { types=types, autorization_form_id=autorization_form_id } =
  "SendPassportAuthorizationForm" ++ cc [p "types" types, p "autorization_form_id" autorization_form_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON SendPassportAuthorizationForm where
 toJSON SendPassportAuthorizationForm { types = types, autorization_form_id = autorization_form_id } =
  A.object [ "@type" A..= T.String "sendPassportAuthorizationForm", "types" A..= types, "autorization_form_id" A..= autorization_form_id ]

instance T.FromJSON SendPassportAuthorizationForm where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "sendPassportAuthorizationForm" -> parseSendPassportAuthorizationForm v
   _ -> mempty
  where
   parseSendPassportAuthorizationForm :: A.Value -> T.Parser SendPassportAuthorizationForm
   parseSendPassportAuthorizationForm = A.withObject "SendPassportAuthorizationForm" $ \o -> do
    types <- o A..:? "types"
    autorization_form_id <- mconcat [ o A..:? "autorization_form_id", readMaybe <$> (o A..: "autorization_form_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SendPassportAuthorizationForm { types = types, autorization_form_id = autorization_form_id }
 parseJSON _ = mempty
