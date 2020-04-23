-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchPublicChat where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data SearchPublicChat = 
 SearchPublicChat { username :: Maybe String }  deriving (Show)

instance T.ToJSON SearchPublicChat where
 toJSON (SearchPublicChat { username = username }) =
  A.object [ "@type" A..= T.String "searchPublicChat", "username" A..= username ]

instance T.FromJSON SearchPublicChat where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "searchPublicChat" -> parseSearchPublicChat v
   _ -> mempty
  where
   parseSearchPublicChat :: A.Value -> T.Parser SearchPublicChat
   parseSearchPublicChat = A.withObject "SearchPublicChat" $ \o -> do
    username <- optional $ o A..: "username"
    return $ SearchPublicChat { username = username }