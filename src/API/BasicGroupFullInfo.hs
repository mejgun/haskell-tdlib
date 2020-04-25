-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.BasicGroupFullInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatMember as ChatMember

data BasicGroupFullInfo = 
 BasicGroupFullInfo { invite_link :: Maybe String, members :: Maybe [ChatMember.ChatMember], creator_user_id :: Maybe Int, description :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON BasicGroupFullInfo where
 toJSON (BasicGroupFullInfo { invite_link = invite_link, members = members, creator_user_id = creator_user_id, description = description }) =
  A.object [ "@type" A..= T.String "basicGroupFullInfo", "invite_link" A..= invite_link, "members" A..= members, "creator_user_id" A..= creator_user_id, "description" A..= description ]

instance T.FromJSON BasicGroupFullInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "basicGroupFullInfo" -> parseBasicGroupFullInfo v
   _ -> mempty
  where
   parseBasicGroupFullInfo :: A.Value -> T.Parser BasicGroupFullInfo
   parseBasicGroupFullInfo = A.withObject "BasicGroupFullInfo" $ \o -> do
    invite_link <- o A..:? "invite_link"
    members <- o A..:? "members"
    creator_user_id <- mconcat [ o A..:? "creator_user_id", readMaybe <$> (o A..: "creator_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    description <- o A..:? "description"
    return $ BasicGroupFullInfo { invite_link = invite_link, members = members, creator_user_id = creator_user_id, description = description }