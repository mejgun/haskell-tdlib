-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetPassportElementErrors where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputPassportElementError as InputPassportElementError

data SetPassportElementErrors = 
 SetPassportElementErrors { errors :: Maybe [InputPassportElementError.InputPassportElementError], user_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON SetPassportElementErrors where
 toJSON (SetPassportElementErrors { errors = errors, user_id = user_id }) =
  A.object [ "@type" A..= T.String "setPassportElementErrors", "errors" A..= errors, "user_id" A..= user_id ]

instance T.FromJSON SetPassportElementErrors where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setPassportElementErrors" -> parseSetPassportElementErrors v
   _ -> mempty
  where
   parseSetPassportElementErrors :: A.Value -> T.Parser SetPassportElementErrors
   parseSetPassportElementErrors = A.withObject "SetPassportElementErrors" $ \o -> do
    errors <- o A..:? "errors"
    user_id <- mconcat [ o A..:? "user_id", readMaybe <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SetPassportElementErrors { errors = errors, user_id = user_id }