-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.UnblockUser where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Removes a user from the blacklist 
-- 
-- __user_id__ User identifier
data UnblockUser = 

 UnblockUser { user_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON UnblockUser where
 toJSON (UnblockUser { user_id = user_id }) =
  A.object [ "@type" A..= T.String "unblockUser", "user_id" A..= user_id ]

instance T.FromJSON UnblockUser where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "unblockUser" -> parseUnblockUser v
   _ -> mempty
  where
   parseUnblockUser :: A.Value -> T.Parser UnblockUser
   parseUnblockUser = A.withObject "UnblockUser" $ \o -> do
    user_id <- mconcat [ o A..:? "user_id", readMaybe <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UnblockUser { user_id = user_id }