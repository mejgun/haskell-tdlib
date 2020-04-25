-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CreateCall where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.CallProtocol as CallProtocol

data CreateCall = 
 CreateCall { protocol :: Maybe CallProtocol.CallProtocol, user_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON CreateCall where
 toJSON (CreateCall { protocol = protocol, user_id = user_id }) =
  A.object [ "@type" A..= T.String "createCall", "protocol" A..= protocol, "user_id" A..= user_id ]

instance T.FromJSON CreateCall where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "createCall" -> parseCreateCall v
   _ -> mempty
  where
   parseCreateCall :: A.Value -> T.Parser CreateCall
   parseCreateCall = A.withObject "CreateCall" $ \o -> do
    protocol <- o A..:? "protocol"
    user_id <- mconcat [ o A..:? "user_id", readMaybe <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ CreateCall { protocol = protocol, user_id = user_id }