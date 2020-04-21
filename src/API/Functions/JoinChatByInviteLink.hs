-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.JoinChatByInviteLink where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data JoinChatByInviteLink = 
 JoinChatByInviteLink { invite_link :: String }  deriving (Show)

instance T.ToJSON JoinChatByInviteLink where
 toJSON (JoinChatByInviteLink { invite_link = invite_link }) =
  A.object [ "@type" A..= T.String "joinChatByInviteLink", "invite_link" A..= invite_link ]



instance T.FromJSON JoinChatByInviteLink where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "joinChatByInviteLink" -> parseJoinChatByInviteLink v

   _ -> mempty ""
  where
   parseJoinChatByInviteLink :: A.Value -> T.Parser JoinChatByInviteLink
   parseJoinChatByInviteLink = A.withObject "JoinChatByInviteLink" $ \o -> do
    invite_link <- o A..: "invite_link"
    return $ JoinChatByInviteLink { invite_link = invite_link }