-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SharePhoneNumber where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Shares the phone number of the current user with a mutual contact. Supposed to be called when the user clicks on chatActionBarSharePhoneNumber 
-- 
-- __user_id__ Identifier of the user with whom to share the phone number. The user must be a mutual contact
data SharePhoneNumber = 

 SharePhoneNumber { user_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON SharePhoneNumber where
 toJSON (SharePhoneNumber { user_id = user_id }) =
  A.object [ "@type" A..= T.String "sharePhoneNumber", "user_id" A..= user_id ]

instance T.FromJSON SharePhoneNumber where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "sharePhoneNumber" -> parseSharePhoneNumber v
   _ -> mempty
  where
   parseSharePhoneNumber :: A.Value -> T.Parser SharePhoneNumber
   parseSharePhoneNumber = A.withObject "SharePhoneNumber" $ \o -> do
    user_id <- mconcat [ o A..:? "user_id", readMaybe <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SharePhoneNumber { user_id = user_id }