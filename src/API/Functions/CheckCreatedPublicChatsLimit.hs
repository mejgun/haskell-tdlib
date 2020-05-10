-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CheckCreatedPublicChatsLimit where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.PublicChatType as PublicChatType

-- |
-- 
-- Checks whether the maximum number of owned public chats has been reached. Returns corresponding error if the limit was reached 
-- 
-- __type__ Type of the public chats, for which to check the limit
data CheckCreatedPublicChatsLimit = 

 CheckCreatedPublicChatsLimit { _type :: Maybe PublicChatType.PublicChatType }  deriving (Show, Eq)

instance T.ToJSON CheckCreatedPublicChatsLimit where
 toJSON (CheckCreatedPublicChatsLimit { _type = _type }) =
  A.object [ "@type" A..= T.String "checkCreatedPublicChatsLimit", "type" A..= _type ]

instance T.FromJSON CheckCreatedPublicChatsLimit where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "checkCreatedPublicChatsLimit" -> parseCheckCreatedPublicChatsLimit v
   _ -> mempty
  where
   parseCheckCreatedPublicChatsLimit :: A.Value -> T.Parser CheckCreatedPublicChatsLimit
   parseCheckCreatedPublicChatsLimit = A.withObject "CheckCreatedPublicChatsLimit" $ \o -> do
    _type <- o A..:? "type"
    return $ CheckCreatedPublicChatsLimit { _type = _type }