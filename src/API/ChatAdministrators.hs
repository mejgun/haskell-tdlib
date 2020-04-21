-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatAdministrators where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatAdministrator as ChatAdministrator

--main = putStrLn "ok"

data ChatAdministrators = 
 ChatAdministrators { administrators :: [ChatAdministrator.ChatAdministrator] }  deriving (Show)

instance T.ToJSON ChatAdministrators where
 toJSON (ChatAdministrators { administrators = administrators }) =
  A.object [ "@type" A..= T.String "chatAdministrators", "administrators" A..= administrators ]



instance T.FromJSON ChatAdministrators where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatAdministrators" -> parseChatAdministrators v

   _ -> mempty ""
  where
   parseChatAdministrators :: A.Value -> T.Parser ChatAdministrators
   parseChatAdministrators = A.withObject "ChatAdministrators" $ \o -> do
    administrators <- o A..: "administrators"
    return $ ChatAdministrators { administrators = administrators }