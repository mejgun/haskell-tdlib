-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchCallMessages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SearchCallMessages = 
 SearchCallMessages { only_missed :: Bool, limit :: Int, from_message_id :: Int }  -- deriving (Show)

instance T.ToJSON SearchCallMessages where
 toJSON (SearchCallMessages { only_missed = only_missed, limit = limit, from_message_id = from_message_id }) =
  A.object [ "@type" A..= T.String "searchCallMessages", "only_missed" A..= only_missed, "limit" A..= limit, "from_message_id" A..= from_message_id ]
-- searchCallMessages SearchCallMessages  { only_missed :: Bool, limit :: Int, from_message_id :: Int } 



instance T.FromJSON SearchCallMessages where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "searchCallMessages" -> parseSearchCallMessages v
  where
   parseSearchCallMessages :: A.Value -> T.Parser SearchCallMessages
   parseSearchCallMessages = A.withObject "SearchCallMessages" $ \o -> do
    only_missed <- o A..: "only_missed"
    limit <- o A..: "limit"
    from_message_id <- o A..: "from_message_id"
    return $ SearchCallMessages { only_missed = only_missed, limit = limit, from_message_id = from_message_id }