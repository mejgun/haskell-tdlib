-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SendPassportAuthorizationForm where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.PassportElementType as PassportElementType

--main = putStrLn "ok"

data SendPassportAuthorizationForm = 
 SendPassportAuthorizationForm { types :: [PassportElementType.PassportElementType], autorization_form_id :: Int }  -- deriving (Show)

instance T.ToJSON SendPassportAuthorizationForm where
 toJSON (SendPassportAuthorizationForm { types = types, autorization_form_id = autorization_form_id }) =
  A.object [ "@type" A..= T.String "sendPassportAuthorizationForm", "types" A..= types, "autorization_form_id" A..= autorization_form_id ]
-- sendPassportAuthorizationForm SendPassportAuthorizationForm  { types :: [PassportElementType.PassportElementType], autorization_form_id :: Int } 



instance T.FromJSON SendPassportAuthorizationForm where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "sendPassportAuthorizationForm" -> parseSendPassportAuthorizationForm v
  where
   parseSendPassportAuthorizationForm :: A.Value -> T.Parser SendPassportAuthorizationForm
   parseSendPassportAuthorizationForm = A.withObject "SendPassportAuthorizationForm" $ \o -> do
    types <- o A..: "types"
    autorization_form_id <- o A..: "autorization_form_id"
    return $ SendPassportAuthorizationForm { types = types, autorization_form_id = autorization_form_id }