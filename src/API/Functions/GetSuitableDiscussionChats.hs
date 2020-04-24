-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetSuitableDiscussionChats where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetSuitableDiscussionChats = 
 GetSuitableDiscussionChats deriving (Show, Eq)

instance T.ToJSON GetSuitableDiscussionChats where
 toJSON (GetSuitableDiscussionChats {  }) =
  A.object [ "@type" A..= T.String "getSuitableDiscussionChats" ]

instance T.FromJSON GetSuitableDiscussionChats where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getSuitableDiscussionChats" -> parseGetSuitableDiscussionChats v
   _ -> mempty
  where
   parseGetSuitableDiscussionChats :: A.Value -> T.Parser GetSuitableDiscussionChats
   parseGetSuitableDiscussionChats = A.withObject "GetSuitableDiscussionChats" $ \o -> do
    return $ GetSuitableDiscussionChats {  }