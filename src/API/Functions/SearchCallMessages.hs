-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchCallMessages where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data SearchCallMessages = 
 SearchCallMessages { only_missed :: Maybe Bool, limit :: Maybe Int, from_message_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON SearchCallMessages where
 toJSON (SearchCallMessages { only_missed = only_missed, limit = limit, from_message_id = from_message_id }) =
  A.object [ "@type" A..= T.String "searchCallMessages", "only_missed" A..= only_missed, "limit" A..= limit, "from_message_id" A..= from_message_id ]

instance T.FromJSON SearchCallMessages where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "searchCallMessages" -> parseSearchCallMessages v
   _ -> mempty
  where
   parseSearchCallMessages :: A.Value -> T.Parser SearchCallMessages
   parseSearchCallMessages = A.withObject "SearchCallMessages" $ \o -> do
    only_missed <- optional $ o A..: "only_missed"
    limit <- optional $ o A..: "limit"
    from_message_id <- optional $ o A..: "from_message_id"
    return $ SearchCallMessages { only_missed = only_missed, limit = limit, from_message_id = from_message_id }