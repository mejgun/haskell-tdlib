-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ClearAllDraftMessages where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data ClearAllDraftMessages = 
 ClearAllDraftMessages { exclude_secret_chats :: Maybe Bool }  deriving (Show)

instance T.ToJSON ClearAllDraftMessages where
 toJSON (ClearAllDraftMessages { exclude_secret_chats = exclude_secret_chats }) =
  A.object [ "@type" A..= T.String "clearAllDraftMessages", "exclude_secret_chats" A..= exclude_secret_chats ]

instance T.FromJSON ClearAllDraftMessages where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "clearAllDraftMessages" -> parseClearAllDraftMessages v
   _ -> mempty
  where
   parseClearAllDraftMessages :: A.Value -> T.Parser ClearAllDraftMessages
   parseClearAllDraftMessages = A.withObject "ClearAllDraftMessages" $ \o -> do
    exclude_secret_chats <- optional $ o A..: "exclude_secret_chats"
    return $ ClearAllDraftMessages { exclude_secret_chats = exclude_secret_chats }