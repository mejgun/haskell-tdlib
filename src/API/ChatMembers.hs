-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatMembers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatMember as ChatMember

--main = putStrLn "ok"

data ChatMembers = 
 ChatMembers { members :: [ChatMember.ChatMember], total_count :: Int }  -- deriving (Show)

instance T.ToJSON ChatMembers where
 toJSON (ChatMembers { members = members, total_count = total_count }) =
  A.object [ "@type" A..= T.String "chatMembers", "members" A..= members, "total_count" A..= total_count ]
-- chatMembers ChatMembers  { members :: [ChatMember.ChatMember], total_count :: Int } 



instance T.FromJSON ChatMembers where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatMembers" -> parseChatMembers v
  where
   parseChatMembers :: A.Value -> T.Parser ChatMembers
   parseChatMembers = A.withObject "ChatMembers" $ \o -> do
    members <- o A..: "members"
    total_count <- o A..: "total_count"
    return $ ChatMembers { members = members, total_count = total_count }