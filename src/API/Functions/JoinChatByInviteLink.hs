-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.JoinChatByInviteLink where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Uses an invite link to add the current user to the chat if possible 
-- 
-- __invite_link__ Invite link to use
data JoinChatByInviteLink = 

 JoinChatByInviteLink { invite_link :: Maybe String }  deriving (Eq)

instance Show JoinChatByInviteLink where
 show JoinChatByInviteLink { invite_link=invite_link } =
  "JoinChatByInviteLink" ++ cc [p "invite_link" invite_link ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON JoinChatByInviteLink where
 toJSON JoinChatByInviteLink { invite_link = invite_link } =
  A.object [ "@type" A..= T.String "joinChatByInviteLink", "invite_link" A..= invite_link ]

instance T.FromJSON JoinChatByInviteLink where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "joinChatByInviteLink" -> parseJoinChatByInviteLink v
   _ -> mempty
  where
   parseJoinChatByInviteLink :: A.Value -> T.Parser JoinChatByInviteLink
   parseJoinChatByInviteLink = A.withObject "JoinChatByInviteLink" $ \o -> do
    invite_link <- o A..:? "invite_link"
    return $ JoinChatByInviteLink { invite_link = invite_link }
 parseJSON _ = mempty
