-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.EndGroupCallRecording where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Ends recording of an active group call. Requires groupCall.can_be_managed group call flag 
-- 
-- __group_call_id__ Group call identifier
data EndGroupCallRecording = 

 EndGroupCallRecording { group_call_id :: Maybe Int }  deriving (Eq)

instance Show EndGroupCallRecording where
 show EndGroupCallRecording { group_call_id=group_call_id } =
  "EndGroupCallRecording" ++ U.cc [U.p "group_call_id" group_call_id ]

instance T.ToJSON EndGroupCallRecording where
 toJSON EndGroupCallRecording { group_call_id = group_call_id } =
  A.object [ "@type" A..= T.String "endGroupCallRecording", "group_call_id" A..= group_call_id ]

instance T.FromJSON EndGroupCallRecording where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "endGroupCallRecording" -> parseEndGroupCallRecording v
   _ -> mempty
  where
   parseEndGroupCallRecording :: A.Value -> T.Parser EndGroupCallRecording
   parseEndGroupCallRecording = A.withObject "EndGroupCallRecording" $ \o -> do
    group_call_id <- mconcat [ o A..:? "group_call_id", readMaybe <$> (o A..: "group_call_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ EndGroupCallRecording { group_call_id = group_call_id }
 parseJSON _ = mempty
