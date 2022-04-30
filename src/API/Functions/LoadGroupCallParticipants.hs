-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.LoadGroupCallParticipants where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Loads more participants of a group call. The loaded participants will be received through updates. Use the field groupCall.loaded_all_participants to check whether all participants have already been loaded
-- 
-- __group_call_id__ Group call identifier. The group call must be previously received through getGroupCall and must be joined or being joined
-- 
-- __limit__ The maximum number of participants to load; up to 100
data LoadGroupCallParticipants = 

 LoadGroupCallParticipants { limit :: Maybe Int, group_call_id :: Maybe Int }  deriving (Eq)

instance Show LoadGroupCallParticipants where
 show LoadGroupCallParticipants { limit=limit, group_call_id=group_call_id } =
  "LoadGroupCallParticipants" ++ U.cc [U.p "limit" limit, U.p "group_call_id" group_call_id ]

instance T.ToJSON LoadGroupCallParticipants where
 toJSON LoadGroupCallParticipants { limit = limit, group_call_id = group_call_id } =
  A.object [ "@type" A..= T.String "loadGroupCallParticipants", "limit" A..= limit, "group_call_id" A..= group_call_id ]

instance T.FromJSON LoadGroupCallParticipants where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "loadGroupCallParticipants" -> parseLoadGroupCallParticipants v
   _ -> mempty
  where
   parseLoadGroupCallParticipants :: A.Value -> T.Parser LoadGroupCallParticipants
   parseLoadGroupCallParticipants = A.withObject "LoadGroupCallParticipants" $ \o -> do
    limit <- mconcat [ o A..:? "limit", readMaybe <$> (o A..: "limit" :: T.Parser String)] :: T.Parser (Maybe Int)
    group_call_id <- mconcat [ o A..:? "group_call_id", readMaybe <$> (o A..: "group_call_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ LoadGroupCallParticipants { limit = limit, group_call_id = group_call_id }
 parseJSON _ = mempty
