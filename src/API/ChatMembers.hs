-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatMembers where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatMember as ChatMember

data ChatMembers = 
 ChatMembers { members :: Maybe [ChatMember.ChatMember], total_count :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON ChatMembers where
 toJSON (ChatMembers { members = members, total_count = total_count }) =
  A.object [ "@type" A..= T.String "chatMembers", "members" A..= members, "total_count" A..= total_count ]

instance T.FromJSON ChatMembers where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatMembers" -> parseChatMembers v
   _ -> mempty
  where
   parseChatMembers :: A.Value -> T.Parser ChatMembers
   parseChatMembers = A.withObject "ChatMembers" $ \o -> do
    members <- optional $ o A..: "members"
    total_count <- optional $ o A..: "total_count"
    return $ ChatMembers { members = members, total_count = total_count }