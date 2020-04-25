-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.BlockUser where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data BlockUser = 
 BlockUser { user_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON BlockUser where
 toJSON (BlockUser { user_id = user_id }) =
  A.object [ "@type" A..= T.String "blockUser", "user_id" A..= user_id ]

instance T.FromJSON BlockUser where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "blockUser" -> parseBlockUser v
   _ -> mempty
  where
   parseBlockUser :: A.Value -> T.Parser BlockUser
   parseBlockUser = A.withObject "BlockUser" $ \o -> do
    user_id <- mconcat [ o A..:? "user_id", readMaybe <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ BlockUser { user_id = user_id }