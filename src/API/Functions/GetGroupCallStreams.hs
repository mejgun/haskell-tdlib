-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetGroupCallStreams where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Returns information about available group call streams 
-- 
-- __group_call_id__ Group call identifier
data GetGroupCallStreams = 

 GetGroupCallStreams { group_call_id :: Maybe Int }  deriving (Eq)

instance Show GetGroupCallStreams where
 show GetGroupCallStreams { group_call_id=group_call_id } =
  "GetGroupCallStreams" ++ U.cc [U.p "group_call_id" group_call_id ]

instance T.ToJSON GetGroupCallStreams where
 toJSON GetGroupCallStreams { group_call_id = group_call_id } =
  A.object [ "@type" A..= T.String "getGroupCallStreams", "group_call_id" A..= group_call_id ]

instance T.FromJSON GetGroupCallStreams where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getGroupCallStreams" -> parseGetGroupCallStreams v
   _ -> mempty
  where
   parseGetGroupCallStreams :: A.Value -> T.Parser GetGroupCallStreams
   parseGetGroupCallStreams = A.withObject "GetGroupCallStreams" $ \o -> do
    group_call_id <- mconcat [ o A..:? "group_call_id", readMaybe <$> (o A..: "group_call_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetGroupCallStreams { group_call_id = group_call_id }
 parseJSON _ = mempty
