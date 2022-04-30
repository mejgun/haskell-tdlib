-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.GroupCallId where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Contains the group call identifier 
-- 
-- __id__ Group call identifier
data GroupCallId = 

 GroupCallId { _id :: Maybe Int }  deriving (Eq)

instance Show GroupCallId where
 show GroupCallId { _id=_id } =
  "GroupCallId" ++ U.cc [U.p "_id" _id ]

instance T.ToJSON GroupCallId where
 toJSON GroupCallId { _id = _id } =
  A.object [ "@type" A..= T.String "groupCallId", "id" A..= _id ]

instance T.FromJSON GroupCallId where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "groupCallId" -> parseGroupCallId v
   _ -> mempty
  where
   parseGroupCallId :: A.Value -> T.Parser GroupCallId
   parseGroupCallId = A.withObject "GroupCallId" $ \o -> do
    _id <- mconcat [ o A..:? "id", readMaybe <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GroupCallId { _id = _id }
 parseJSON _ = mempty
