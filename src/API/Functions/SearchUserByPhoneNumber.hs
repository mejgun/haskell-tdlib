-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchUserByPhoneNumber where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Searches a user by their phone number. Returns a 404 error if the user can't be found 
-- 
-- __phone_number__ Phone number to search for
data SearchUserByPhoneNumber = 

 SearchUserByPhoneNumber { phone_number :: Maybe String }  deriving (Eq)

instance Show SearchUserByPhoneNumber where
 show SearchUserByPhoneNumber { phone_number=phone_number } =
  "SearchUserByPhoneNumber" ++ U.cc [U.p "phone_number" phone_number ]

instance T.ToJSON SearchUserByPhoneNumber where
 toJSON SearchUserByPhoneNumber { phone_number = phone_number } =
  A.object [ "@type" A..= T.String "searchUserByPhoneNumber", "phone_number" A..= phone_number ]

instance T.FromJSON SearchUserByPhoneNumber where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "searchUserByPhoneNumber" -> parseSearchUserByPhoneNumber v
   _ -> mempty
  where
   parseSearchUserByPhoneNumber :: A.Value -> T.Parser SearchUserByPhoneNumber
   parseSearchUserByPhoneNumber = A.withObject "SearchUserByPhoneNumber" $ \o -> do
    phone_number <- o A..:? "phone_number"
    return $ SearchUserByPhoneNumber { phone_number = phone_number }
 parseJSON _ = mempty
