-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Users where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Represents a list of users 
-- 
-- __total_count__ Approximate total count of users found
-- 
-- __user_ids__ A list of user identifiers
data Users = 

 Users { user_ids :: Maybe [Int], total_count :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON Users where
 toJSON (Users { user_ids = user_ids, total_count = total_count }) =
  A.object [ "@type" A..= T.String "users", "user_ids" A..= user_ids, "total_count" A..= total_count ]

instance T.FromJSON Users where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "users" -> parseUsers v
   _ -> mempty
  where
   parseUsers :: A.Value -> T.Parser Users
   parseUsers = A.withObject "Users" $ \o -> do
    user_ids <- o A..:? "user_ids"
    total_count <- mconcat [ o A..:? "total_count", readMaybe <$> (o A..: "total_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ Users { user_ids = user_ids, total_count = total_count }