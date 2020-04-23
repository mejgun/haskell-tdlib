-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.BlockUser where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data BlockUser = 
 BlockUser { user_id :: Maybe Int }  deriving (Show)

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
    user_id <- optional $ o A..: "user_id"
    return $ BlockUser { user_id = user_id }