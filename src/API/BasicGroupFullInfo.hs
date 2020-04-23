-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.BasicGroupFullInfo where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatMember as ChatMember

data BasicGroupFullInfo = 
 BasicGroupFullInfo { invite_link :: Maybe String, members :: Maybe [ChatMember.ChatMember], creator_user_id :: Maybe Int, description :: Maybe String }  deriving (Show)

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
    invite_link <- optional $ o A..: "invite_link"
    members <- optional $ o A..: "members"
    creator_user_id <- optional $ o A..: "creator_user_id"
    description <- optional $ o A..: "description"
    return $ BasicGroupFullInfo { invite_link = invite_link, members = members, creator_user_id = creator_user_id, description = description }