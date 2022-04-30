-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CreateCall where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.CallProtocol as CallProtocol

-- |
-- 
-- Creates a new call 
-- 
-- __user_id__ Identifier of the user to be called
-- 
-- __protocol__ The call protocols supported by the application
-- 
-- __is_video__ Pass true to create a video call
data CreateCall = 

 CreateCall { is_video :: Maybe Bool, protocol :: Maybe CallProtocol.CallProtocol, user_id :: Maybe Int }  deriving (Eq)

instance Show CreateCall where
 show CreateCall { is_video=is_video, protocol=protocol, user_id=user_id } =
  "CreateCall" ++ U.cc [U.p "is_video" is_video, U.p "protocol" protocol, U.p "user_id" user_id ]

instance T.ToJSON CreateCall where
 toJSON CreateCall { is_video = is_video, protocol = protocol, user_id = user_id } =
  A.object [ "@type" A..= T.String "createCall", "is_video" A..= is_video, "protocol" A..= protocol, "user_id" A..= user_id ]

instance T.FromJSON CreateCall where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "createCall" -> parseCreateCall v
   _ -> mempty
  where
   parseCreateCall :: A.Value -> T.Parser CreateCall
   parseCreateCall = A.withObject "CreateCall" $ \o -> do
    is_video <- o A..:? "is_video"
    protocol <- o A..:? "protocol"
    user_id <- mconcat [ o A..:? "user_id", readMaybe <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ CreateCall { is_video = is_video, protocol = protocol, user_id = user_id }
 parseJSON _ = mempty
