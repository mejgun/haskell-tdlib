-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.BasicGroup where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatMemberStatus as ChatMemberStatus

data BasicGroup = 
 BasicGroup { upgraded_to_supergroup_id :: Maybe Int, is_active :: Maybe Bool, status :: Maybe ChatMemberStatus.ChatMemberStatus, member_count :: Maybe Int, _id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON BasicGroup where
 toJSON (BasicGroup { upgraded_to_supergroup_id = upgraded_to_supergroup_id, is_active = is_active, status = status, member_count = member_count, _id = _id }) =
  A.object [ "@type" A..= T.String "basicGroup", "upgraded_to_supergroup_id" A..= upgraded_to_supergroup_id, "is_active" A..= is_active, "status" A..= status, "member_count" A..= member_count, "id" A..= _id ]

instance T.FromJSON BasicGroup where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "basicGroup" -> parseBasicGroup v
   _ -> mempty
  where
   parseBasicGroup :: A.Value -> T.Parser BasicGroup
   parseBasicGroup = A.withObject "BasicGroup" $ \o -> do
    upgraded_to_supergroup_id <- mconcat [ o A..:? "upgraded_to_supergroup_id", readMaybe <$> (o A..: "upgraded_to_supergroup_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    is_active <- o A..:? "is_active"
    status <- o A..:? "status"
    member_count <- mconcat [ o A..:? "member_count", readMaybe <$> (o A..: "member_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    _id <- mconcat [ o A..:? "_id", readMaybe <$> (o A..: "_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ BasicGroup { upgraded_to_supergroup_id = upgraded_to_supergroup_id, is_active = is_active, status = status, member_count = member_count, _id = _id }