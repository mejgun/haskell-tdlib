-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatMembers where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatMember as ChatMember

-- |
-- 
-- Contains a list of chat members 
-- 
-- __total_count__ Approximate total count of chat members found
-- 
-- __members__ A list of chat members
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
    members <- o A..:? "members"
    total_count <- mconcat [ o A..:? "total_count", readMaybe <$> (o A..: "total_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ChatMembers { members = members, total_count = total_count }